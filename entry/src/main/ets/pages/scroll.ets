import { hilog } from '@kit.PerformanceAnalysisKit';
import { aContext } from '../entryability/abilityContext';
import Head from '../../../component/scroll/head';

interface Item {
  index: number;
}

@Entry
@Component
struct IScroll {
  scroller: Scroller = new Scroller()
  @State alpha: number = 0;
  @State data: Item[] = [{ index: 1 }, { index: 2 }, { index: 3 }, { index: 4 }, { index: 5 }, { index: 6 }, {
    index: 7
  }, { index: 8 }, { index: 9 }]

  async aboutToAppear(): Promise<void> {
    await aContext.mainWindowClass?.setWindowLayoutFullScreen(true)

    hilog.info(0x0000, 'look isFullScreen ', 'page_aboutToAppear' + aContext.mainWindowClass?.getWindowProperties().isLayoutFullScreen)
  }

  // onPageShow(): void {

  // window.getLastWindow({ stageMode: true }, (err: BusinessError, mainWindowClass) => {
  //   let errCode: number = err.code;
  //   if (errCode) {
  //     console.error('Failed to get the subWindow. Cause: ' + JSON.stringify(err));
  //     return;
  //   }
  //   console.info('Succeeded in getting subWindow. Data: ' + JSON.stringify(mainWindowClass));
  //   mainWindowClass.setWindowLayoutFullScreen(true);
  // })
  // }

  build() {
    Column() {
      // Column() {
      //
      // }
      // .position({
      //   x: 0,
      //   y: 0
      // })
      // .width('100%')
      // .height(44)
      // .backgroundColor(`rgba(23,114,246,${this.alpha})`)
      // .zIndex(1)
      Head({ mainWindowClass: aContext.mainWindowClass, isFullScreen: true, alpha: this.alpha })
      Scroll(this.scroller) {
        Column() {
          ForEach(this.data, (item: Item) => {
            if (item) {
              Row() {
                Text(String(item.index)).fontSize(20)
              }.width('90%').height(150).backgroundColor('rgba(0,0,0,0.1)').margin({ bottom: 20 })
            }
          }, (item: Item) => {
            return item.index + ''
          })
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .scrollBarWidth(1)
      .edgeEffect(EdgeEffect.Spring)
      .height('100%')
      .width('100%')
      .flingSpeedLimit(3000) // 每秒最大可以滚动多少距离
      .onScroll((xOffset, yOffset) => { // 这里好像是单个距离上次位置的偏移
        const offset = this.scroller.currentOffset()
        hilog.info(0x0000, 'yOffset', offset.yOffset + ':' + yOffset)
        if (offset.yOffset <= 100) {
          this.alpha = offset.yOffset / 100
        } else if (this.alpha !== 1) {
          this.alpha = 1
        }

      })

      .onReachEnd(() => {
        const len = this.data.length
        const lastOne = this.data[len - 1];
        const additives: Item[] = []
        while (additives.length < 10) {
          additives.push({
            index: lastOne.index + additives.length
          })
        }
        // 直接push可以出发更新
        this.data.push(...additives)
        // 下面这种concat之后直接复制会引起卡顿
        // this.data = this.data.concat(additives)
      })

      // .gesture()
    }.width('100%')
    .height('100%')
  }
}