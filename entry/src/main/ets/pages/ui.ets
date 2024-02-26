import type { UIStyles } from './ui_type'

@Styles
function spacious() {
  .flexGrow(1)
  .flexShrink(0)
  .flexBasis(1)
}


export const uiStyles: UIStyles = {
  spacious
}
export const spacious1 = spacious