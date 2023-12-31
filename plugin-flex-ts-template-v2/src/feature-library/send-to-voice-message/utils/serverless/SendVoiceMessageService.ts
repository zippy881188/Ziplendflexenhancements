import * as Flex from '@twilio/flex-ui';

import { EncodedParams } from '../../../../types/serverless';
import ApiService from '../../../../utils/serverless/ApiService';

export interface ParticipantAndMessage {
  success: boolean;
  customerParticipant: string;
  voiceMessage: string;
}

export interface VoicePrompt {
  success: boolean;
  body: string;
}

class SendVoiceMessageService extends ApiService {
  async sendVoiceMessageAndUpdateParticipant(customerParticipant: string, voiceMessage: string): Promise<boolean> {
    try {
      // Remove Conference Participant (which is the agent) and also send a voice message
      const { success } = await this.#sendVoiceMessageAndUpdateParticipant(customerParticipant, voiceMessage);
      return success;
    } catch (error) {
      if (error instanceof TypeError) {
        error.message = 'Unable to reach host';
      }
      return false;
    }
  }

  async queryAssets(fullName: string): Promise<any> {
    try {
      return await this.#queryAssets(fullName);
    } catch (error) {
      if (error instanceof TypeError) {
        error.message = 'Unable to reach host';
      }
      return false;
    }
  }

  #sendVoiceMessageAndUpdateParticipant = async (
    customerParticipant: string,
    voiceMessage: string,
  ): Promise<ParticipantAndMessage> => {
    const manager = Flex.Manager.getInstance();

    const encodedParams: EncodedParams = {
      Token: encodeURIComponent(manager.user.token),
      customerParticipant: encodeURIComponent(customerParticipant),
      voiceMessage: encodeURIComponent(voiceMessage),
    };

    return this.fetchJsonWithReject<ParticipantAndMessage>(
      `${this.serverlessProtocol}://${this.serverlessDomain}/features/send-to-voice-message/flex/send-to-voice-message`,
      {
        method: 'post',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: this.buildBody(encodedParams),
      },
    ).then((response): ParticipantAndMessage => {
      return {
        ...response,
      };
    });
  };

  #queryAssets = async (fullName: string): Promise<VoicePrompt> => {
    const manager = Flex.Manager.getInstance();

    const encodedParams: EncodedParams = {
      Token: encodeURIComponent(manager.user.token),
      fullName: encodeURIComponent(fullName),
    };

    return this.fetchJsonWithReject<VoicePrompt>(
      `${this.serverlessProtocol}://${this.serverlessDomain}/features/send-to-voice-message/flex/query-assets`,
      {
        method: 'post',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: this.buildBody(encodedParams),
      },
    ).then((response): VoicePrompt => {
      return response;
    });
  };
}

export default new SendVoiceMessageService();
