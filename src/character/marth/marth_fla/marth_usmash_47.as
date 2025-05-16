// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_usmash_47

package marth_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class marth_usmash_47 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var connected:*;
        public var xframe:String;

        public function marth_usmash_47()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 11, this.frame12, 12, this.frame13, 15, this.frame16, 16, this.frame17, 31, this.frame32);
        }

        public function refresh(_arg_1:*):*
        {
            if (_arg_1.data.attackBoxData.damage < 10)
            {
                this.connected = true;
                SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.refresh);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.connected = false;
            this.xframe = null;
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.refresh);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("sideBCheck", 0);
            };
        }

        internal function frame6():*
        {
            this.xframe = "charging";
        }

        internal function frame12():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame13():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame17():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.refresh);
            if (this.connected)
            {
                this.self.refreshAttackID();
            };
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

