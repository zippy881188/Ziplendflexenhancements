output "workspace_sid" {
  value = twilio_taskrouter_workspaces_v1.flex.sid
  description = "Flex Task Assignment workspace SID"
}

output "workflow_sid_assign_to_anyone" {
  value = twilio_taskrouter_workspaces_workflows_v1.assign_to_anyone.sid
  description = "Assign To Anyone workflow SID"
}

output "workflow_sid_chat_transfer" {
  value = twilio_taskrouter_workspaces_workflows_v1.chat_transfer.sid
  description = "conversation-transfer feature workflow SID"
}

output "workflow_sid_callback" {
  value = twilio_taskrouter_workspaces_workflows_v1.callback.sid
  description = "callback-and-voicemail feature workflow SID"
}

output "workflow_sid_internal_call" {
  value = twilio_taskrouter_workspaces_workflows_v1.internal_call.sid
  description = "internal call feature workflow SID"
}

output "workflow_sid_direct_line" {
  value = twilio_taskrouter_workspaces_workflows_v1.direct_line.sid
  description = "direct line feature workflow SID"
}

output "chat_channel_sid" {
  value = twilio_taskrouter_workspaces_task_channels_v1.chat.sid
  description = "Chat channel SID"
}

output "voice_channel_sid" {
  value = twilio_taskrouter_workspaces_task_channels_v1.voice.sid
  description = "Voice channel SID"
}

output "workflow_sid_ziplend_homepage" {
  value = twilio_taskrouter_workspaces_workflows_v1.ziplend_homepage_workflow.sid
  description = "Zipland Homepage SID"
}

output "workflow_sid_incoming_live_transfers" {
  value = twilio_taskrouter_workspaces_workflows_v1.incoming_live_transfers_workflow.sid
  description = "Incoming Live Transfers SID"
}
