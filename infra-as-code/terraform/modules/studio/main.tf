terraform {
  required_providers {
    twilio = {
      source  = "twilio/twilio"
      version = ">=0.4.0"
    }
  }
}

resource "twilio_studio_flows_v2" "chat" {
  friendly_name  = "Chat Flow"
  status         = "published"
  definition = templatefile("../../studio/chat-flow.json", local.params)
}

resource "twilio_studio_flows_v2" "messaging" {
  friendly_name  = "Messaging Flow"
  status         = "published"
  definition = templatefile("../../studio/messaging-flow.json", local.params)
}

resource "twilio_studio_flows_v2" "voice" {
  friendly_name  = "Voice IVR"
  status         = "published"
  definition = templatefile("../../studio/voice-flow.json", local.params)
}

resource "twilio_studio_flows_v2" "ziplendHomepage" {
  friendly_name  = "Ziplend Homepage"
  status         = "published"
  definition = templatefile("../../studio/ziplend-homepage.json", local.params)
}

resource "twilio_studio_flows_v2" "incomingLiveTransfers" {
  friendly_name  = "Incoming Live Transfers"
  status         = "published"
  definition = templatefile("../../studio/incoming-live-transfers.json", local.params)
}

resource "twilio_studio_flows_v2" "directLine" {
  friendly_name  = "Direct Line"
  status         = "published"
  definition = templatefile("../../studio/direct-line.json", local.params)
}

locals{
  params = {
    "WORKFLOW_SID_ASSIGN_TO_ANYONE" = var.workflow_sid_assign_to_anyone
    "WORKFLOW_SID_ZIPLEND_HOMEPAGE" = var.workflow_sid_ziplend_homepage
    "WORKFLOW_SID_INCOMING_LIVE_TRANSFERS" = var.workflow_sid_incoming_live_transfers
    "WORKFLOW_SID_DIRECT_LINE" = var.workflow_sid_direct_line
    "SERVERLESS_DOMAIN" = var.serverless_domain
    "SERVERLESS_SID" = var.serverless_sid
    "SERVERLESS_ENV_SID" = var.serverless_env_sid
    "SCHEDULE_MANAGER_DOMAIN" = var.schedule_manager_domain
    "SCHEDULE_MANAGER_SID" = var.schedule_manager_sid
    "SCHEDULE_MANAGER_ENV_SID" = var.schedule_manager_env_sid
    "FUNCTION_CHECK_SCHEDULE_SID" = var.function_check_schedule_sid
    "FUNCTION_CREATE_CALLBACK" = var.function_create_callback
    "CHAT_CHANNEL_SID" = var.chat_channel_sid
    "VOICE_CHANNEL_SID" = var.voice_channel_sid
  }
}
