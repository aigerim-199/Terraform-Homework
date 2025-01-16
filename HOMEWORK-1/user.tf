resource "aws_iam_user" "user1" {
  name = "jenny"
}

resource "aws_iam_user" "user2" {
  name = "rose"
}

resource "aws_iam_user" "user3" {
  name = "lisa"
}

resource "aws_iam_user" "user4" {
  name = "jisoo"
}
resource "aws_iam_user" "user5" {
  name = "jihyo"
}

resource "aws_iam_user" "user6" {
  name = "sana"
}

resource "aws_iam_user" "user7" {
  name = "momo"
}

resource "aws_iam_user" "user8" {
  name = "dahyun"
}

resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}

resource "aws_iam_group" "twice" {
  name = "twice"
}


resource "aws_iam_group_membership" "team" {
  name = "tf-BP-group-membership"

  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
  ]

  group = aws_iam_group.blackpink.name
}



resource "aws_iam_group_membership" "team2" {
  name = "tf-twice-group-membership"

  users = [
    aws_iam_user.user5.name,
    aws_iam_user.user6.name,
    aws_iam_user.user7.name,
    aws_iam_user.user8.name,
  ]

  group = aws_iam_group.twice.name
}