import router from '@ohos.router';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';

interface RouteItem {
  name: string;
  routeName: string
}

// @Styles
// function spacious() {
//   .flexGrow(1)
//   .flexShrink(0)
//   .flexBasis(1)
// }

@Extend(Row)
function spacious2() {
  .flexGrow(1)
  .flexShrink(0)
  .flexBasis(1)
}

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State data: RouteItem[] = [{ name: '滚动', routeName: 'pages/scroll' }]
  @State message: string = 'Hello World六点十分科技';
  private context = getContext(this) as common.UIAbilityContext;

  startAbilityTest() {
    let context = getContext(this) as common.UIAbilityContext;
    let want: Want = {
      // Want参数信息
    };
    context.startAbility(want);
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        ForEach(this.data, (item: RouteItem) => {
          if (item) {
            Button(item.name).onClick(() => {
              router.pushUrl({
                url: item.routeName
              })
            })
          }
        })
        Row() {
          Text('sdf').fontSize(20)
        }.spacious2()
        .backgroundColor('red')
      }.height('100%')
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
    .scrollBarWidth(1)
    .edgeEffect(EdgeEffect.Spring)
    .height('100%')
    .width('100%')
  }
}