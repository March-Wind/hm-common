import router from '@ohos.router';
import { extractRGBValues, hexToRgb } from '../utils/index'

@Styles
function spacious() {
  .flexGrow(1)
  .flexShrink(0)
  .flexBasis(1)
}


@Component
export struct Placeholder {
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
export struct Head {
  headHeight: number = 44;
  @Prop isFullScreen: Boolean = false;
  @Prop alpha: number = 1;
  @Prop alphaType: 'bg' | 'whole' = 'whole';
  @Prop placeHolder: Boolean = true;
  @Prop statusBarHeight: number = 0
  @Prop bg: string = ''
  @Prop navBg: string = ''
  @Prop isDark: Boolean = false

  synthesisBg() {
    if (this.alphaType === 'bg') {
      if (/^rgb/.test(this.bg)) {
        const rgb = extractRGBValues(this.bg)
        return `rgba(${rgb.join(',')},${this.alpha})`
      }
      if (/^#/.test(this.bg)) {
        const rgb = hexToRgb(this.bg);
        if (rgb === '') {
          return this.bg
        }
        return ` rgba(${rgb.join(',')},${this.alpha})`
      }
    }
    return this.bg
  }

  build() {
    Column() {
      // 绝对定位
      Column() {
        Row() {
          Image($r("app.media.lzy_common_back"))
            .width(24)
            .height(24)
            .margin({ left: 16 })
            .fillColor(this.isDark ? '#fff' : '#131313')
            .onClick(() => {
              router.back()
            })
          Row() {
            Text('标题').fontColor(this.isDark ? '#fff' : "#131313").fontSize(20)
          }.spacious()
          .justifyContent(FlexAlign.Center)


          Row() {
            Image($r("app.media.lzy_common_share"))
              .width(24)
              .height(24)
              .margin({ left: 16 })
              .fillColor(this.isDark ? '#fff' : '#131313')
              .onClick(() => {
                router.back()
              })
          }.margin({ right: 16 })
        }.width('100%').height('100%').backgroundColor(this.navBg)
      }
      .width('100%')
      .height(this.headHeight + px2vp(this.statusBarHeight))
      .padding({ top: px2vp(this.statusBarHeight) })
      // .backgroundColor(`red`)
      .backgroundColor(this.synthesisBg())
      .opacity(this.alphaType === 'whole' ? this.alpha : 1)
      .position({
        x: 0,
        y: 0
      })

      // 占位
      if (this.placeHolder) {
        Placeholder({ headHeight: px2vp(this.statusBarHeight) + this.headHeight })
      }

    }
    .zIndex(999) // 如果这里不设置增加会有一定的透明度
  }
}