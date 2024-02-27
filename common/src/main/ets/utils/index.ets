/**
 * hex转Rgb
 */
export const hexToRgb = (hexValue: string) => {

  if (typeof hexValue !== 'string' || !(/^#[0-9A-Fa-f]{3}(?:[0-9A-Fa-f]{3})?$/.test(hexValue))) {
    console.error('hexToRgb：' + '输入合法的十六进制值！')
    return ''
  }
  hexValue = hexValue.replace('#', '');
  hexValue = hexValue.length === 3 ? hexValue.replace(/(.)/g, "$1$1") : hexValue;
  // 将十六进制字符串拆分成红、绿、蓝三个部分
  const red = parseInt(hexValue.substring(0, 2), 16);
  const green = parseInt(hexValue.substring(2, 4), 16);
  const blue = parseInt(hexValue.substring(4, 6), 16);

  return [red, green, blue];
}

/**
 * 从rgb或者rgba中提取r，g,b
 */
export const extractRGBValues = (rgbaValue: string) => {
  // 去除可能存在的空格和括号
  rgbaValue = rgbaValue.replace(/[\s()]/g, "");

  // 提取 R、G 和 B 值
  const values = rgbaValue.split(",");
  const r = parseInt(values[0]);
  const g = parseInt(values[1]);
  const b = parseInt(values[2]);


  return [r, g, b];
}