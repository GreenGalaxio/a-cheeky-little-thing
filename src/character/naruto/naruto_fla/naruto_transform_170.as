// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_transform_170

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class naruto_transform_170 extends MovieClip 
    {

        public var self:*;
        public var finished:Boolean;
        public var naruto_language:*;

        public function naruto_transform_170()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 48, this.frame49, 52, this.frame53, 53, this.frame54, 54, this.frame55);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.finished = false;
        }

        internal function frame2():*
        {
            this.naruto_language = this.self.getGlobalVariable("language_Select");
            if (this.naruto_language == "ENG")
            {
                SSF2API.playSound("ENG_kyuubi_naruto_enter1", true);
            }
            else
            {
                SSF2API.playSound("JPN_naruto_kyuubi1", true);
            };
            SSF2API.playSound("kyuubi_enter");
        }

        internal function frame49():*
        {
            if (this.naruto_language == "ENG")
            {
                SSF2API.playSound("ENG_kyuubi_naruto_enter2", true);
            }
            else
            {
                SSF2API.playSound("JPN_naruto_kyuubi2", true);
            };
        }

        internal function frame53():*
        {
        }

        internal function frame54():*
        {
            this.finished = true;
            this.self.activateFinalForm();
            stop();
        }

        internal function frame55():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package naruto_fla

