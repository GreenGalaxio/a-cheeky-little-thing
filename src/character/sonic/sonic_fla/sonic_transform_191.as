// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_transform_191

package sonic_fla
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

    public dynamic class sonic_transform_191 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var finished:Boolean;

        public function sonic_transform_191()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 21, this.frame22, 26, this.frame27, 28, this.frame29, 29, this.frame30);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.finished = false;
            };
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame22():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame27():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame29():*
        {
            this.finished = true;
            this.self.activateFinalForm();
            stop();
        }

        internal function frame30():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package sonic_fla

