region                = "us-east-2"
sm_name               = "datastreamconductor_tf"
starter_lambda_name   = "ec2start_ami_tf"
commander_lambda_name = "ec2commander_tf"
poller_lambda_name    = "CommandPoller_tf"
checker_lambda_name   = "S3ObjectChecker_Tf"
stopper_lambda_name   = "EC2Stopper_tf"
lambda_policy_name    = "datastream_lambda_policy_tf"
lambda_role_name      = "datastream_lambda_role_tf"
runtime               = "python3.12"