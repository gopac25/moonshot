# Internet GW
resource "aws_internet_gateway" "moonshot-gw" {
    vpc_id = "${aws_vpc.moonshot.id}"

    tags = {
        Name = "moonshot-gw"
    }
}
