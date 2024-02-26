/*
 * @Styles和@extend都只能在单个页面内引用，不用export，所以这里只是示例。使用时，请复制代码
 **/
/**
 * 占据剩余空间
 */
@Styles
function spacious() {
  .flexGrow(1)
  .flexShrink(0)
  .flexBasis(1)
}

/**
 * padding是算在高度里的盒模型，可以增加一层单独写padding
 */
