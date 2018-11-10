/**
 * 工具类，对常用的方法进行封装
 */
export default {
    getUID() {
        var d = new Date().getTime();
        var uuid = 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = (d + Math.random() * 16) % 16 | 0;
            d = Math.floor(d / 16);
            return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
        });
        return uuid;
    },
    getCaption(obj, substring) {
        var index = obj.lastIndexOf(substring);
        obj = obj.substring(index + 1, obj.length);
        return obj;
    }
}
