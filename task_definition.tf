resource "aws_ecs_task_definition" "p10_ecs_service" {
  family = "servp10_ecs_serviceice"
  container_definitions = jsonencode([
    {
      name      = "first"
      image     = "service-first"
      cpu       = 2
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    },
    {
      name      = "second"
      image     = "service-second"
      cpu       = 2
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
        }
      ]
    }
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [eu-west-2a, eu-west-2b, eu-west-2c]"
  }
}
