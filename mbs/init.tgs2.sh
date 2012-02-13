#!/sbin/busybox sh

PROP_PATH=/xdata/tweakgs2.prop

BOOT_SND=`grep audioflinger\.bootsnd $PROP_PATH | cut -d'=' -f2`
if [ "$BOOT_SND" = '1' ]; then
  echo audioflinger.bootsnd=1 >> /default.prop
else
  echo audioflinger.bootsnd=0 >> /default.prop
fi

CAMERA_SND=`grep ro\.camera\.sound\.forced $PROP_PATH | cut -d'=' -f2`
if [ "$CAMERA_SND" = '1' ]; then
  echo ro.camera.sound.forced=1 >> /default.prop
else
  echo ro.camera.sound.forced=0 >> /default.prop
fi

LCD_DENSITY=`grep ro\.sf\.lcd_density $PROP_PATH | cut -d'=' -f2`
if [ -z "$LCD_DENSITY" ]; then
  LCD_DENSITY=240
fi
echo ro.sf.lcd_density=$LCD_DENSITY >> /default.prop

