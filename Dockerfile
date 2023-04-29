age 1: Build Apache
FROM ubuntu AS builder
RUN apt-get update && \
    apt-get install -y apache2

# Stage 2: Final image
FROM ubuntu
COPY --from=builder /usr/sbin/apache2 /usr/sbin/apache2
CMD ["apache2", "-DFOREGROUND"]
