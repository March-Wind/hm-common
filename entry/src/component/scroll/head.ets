import window from '@ohos.window';
import { aContext } from '../../main/ets/entryability/abilityContext';

@Component
struct Placeholder {
  @Prop headHeight: number = 44 + 44;

  build() {
    // 占位
    Column() {

    }
    .width('100%')
    .height(this.headHeight)
  }
}

@Component
export default struct Head {
  headHeight: number = 44;
  @Prop mainWindowClass: window.Window | null
  @Prop isFullScreen: Boolean = false;
  @Prop alpha: number = 1;
  @Prop placeHolder: Boolean = true;
  @State statusBarHeight: number = 0

  aboutToAppear(): void {
    if (aContext.avoidArea && this.isFullScreen) {
      this.statusBarHeight = px2vp(aContext.avoidArea?.topRect.height)
    }
  }

  build() {
    Column() {
      // 绝对定位
      Column() {

      }
      .width('100%')
      .height(this.statusBarHeight + this.headHeight)
      .backgroundColor(`rgba(23,114,246,${this.alpha})`)
      .position({
        x: 0,
        y: 0
      })
      .zIndex(12)

      if (this.placeHolder) {
        Placeholder({ headHeight: this.statusBarHeight + this.headHeight })
      }
    }
  }
}