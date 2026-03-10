# ---------- Builder Stage ----------
FROM python:3.11-alpine AS builder

WORKDIR /build

# Install build dependencies
RUN apk add --no-cache build-base libpq-dev

# Copy requirements first (layer cache optimization)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# ---------- Runtime Stage ----------
FROM python:3.11-alpine AS runtime

WORKDIR /app

ENV PATH="/usr/local/bin:${PATH}"

# Install runtime packages
RUN apk add --no-cache libpq wget

# Copy installed packages from builder
COPY --from=builder /install /usr/local

# Copy application code
COPY . .

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

EXPOSE 8000

# Healthcheck endpoint
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget -qO- http://localhost:8000/api/health || exit 1

# Run the Flask app with Gunicorn
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "flask_app:app"]