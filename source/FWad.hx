package;

import sys.io.FileInput;
import haxe.zip.Uncompress;
import format.zip.Data;
import lime.utils.Assets;
import haxe.zip.Entry;
import sys.io.File;
import haxe.io.Path;
import sys.FileSystem;
import Main;
import haxe.zip.Reader;
import haxe.zip.Tools;
//argument helper
class Args
{
    static public var args:Array<String> = Sys.args();
    
    static public function showArgs(){
		trace('Argument: ' + args);
        trace(FWad.loadWad);
    }
}


class FWad extends AssetHelper
{
    var file = Args.args[0];
    static public function loadWad(file:String) {
        var location = Args.args[0];
        var path = sys.io.File.read(location);
        var searchEntryFileName = file;
        trace(path);
        trace(location);
        var entries:List<Entry> = Reader.readZip(path);
        for (entry in entries) {
            trace (entry.fileName);
            trace (entry.compressed);
            if (entry.fileName == searchEntryFileName)
                var data = entry.data.toString();
        }
    }
}


