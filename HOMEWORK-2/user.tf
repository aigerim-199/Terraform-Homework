resource "aws_iam_user" "tw" {
  for_each = toset(["jihyo", "sana", "momo", "dahyun"])
  name     = each.value
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    for i in aws_iam_user.tw : i.name
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "twice"
}
