FROM nginx:1.19.10

# RUN apt-get update && apt-get install -y mathblasters

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
