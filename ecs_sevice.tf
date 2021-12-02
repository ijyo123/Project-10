resource "aws_ecs_service" "p10_ecs_service" {
  name            = "p10_ecs_service"
  cluster         = aws_ecs_cluster.p10_ecs_cluster.id
  task_definition = aws_ecs_task_definition.p10_ecs_service.arn
  desired_count   = 2
}