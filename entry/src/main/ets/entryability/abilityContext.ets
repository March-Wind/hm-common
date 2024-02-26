import { window } from '@kit.ArkUI';
import common from '@ohos.app.ability.common';

interface AContext {
  // 在页面组件中执行mainWindowClass.getAvoidArea(type)返回undefined,
  mainWindowClass: window.Window | null;
  UIAbilityContext: common.UIAbilityContext | null;
  avoidArea: window.AvoidArea | null
}

export const aContext: AContext = {
  mainWindowClass: null,
  UIAbilityContext: null,
  avoidArea: null
}


