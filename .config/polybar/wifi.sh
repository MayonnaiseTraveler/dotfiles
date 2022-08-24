
s=$(ps ax | sed '/grep/d' | grep nm-connection-editor);
if [ -z "$s" ];
then
    nm-connection-editor;
else
    killall nm-connection-editor;
fi
