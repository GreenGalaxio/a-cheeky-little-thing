// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_dashattack_23

package marth_fla
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

    public dynamic class marth_dashattack_23 extends MovieClip 
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

        public function marth_dashattack_23()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 20, this.frame21);
        }

        public function playVoice(_arg_1:int, _arg_2:int):*
        {
            var _local_3:* = (Math.floor((SSF2API.random() * (_arg_2 - _arg_1))) + _arg_1);
            if (_local_3 >= 1)
            {
                this.self.playVoiceSound(_local_3);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.setGlobalVariable("sideBCheck", 0);
                this.self.setXSpeed(14, false);
            };
        }

        internal function frame6():*
        {
            this.playVoice(0, 4);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

