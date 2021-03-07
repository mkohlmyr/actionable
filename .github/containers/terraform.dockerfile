FROM hashicorp/terraform:latest

ADD ../scripts /usr/local/

ENTRYPOINT ["/usr/local/terraform.sh"]