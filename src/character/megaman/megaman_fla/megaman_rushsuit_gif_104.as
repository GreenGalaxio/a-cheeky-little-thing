// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_rushsuit_gif_104

package megaman_fla
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

    public dynamic class megaman_rushsuit_gif_104 extends MovieClip 
    {

        public var self:*;
        public var finished:Boolean;

        public function megaman_rushsuit_gif_104()
        {
            addFrameScript(0, this.frame1, 50, this.frame51, 63, this.frame64, 64, this.frame65, 65, this.frame66);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.finished = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
            };
        }

        internal function frame51():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame64():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame65():*
        {
            this.finished = true;
            this.self.activateFinalForm();
            stop();
        }

        internal function frame66():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package megaman_fla

