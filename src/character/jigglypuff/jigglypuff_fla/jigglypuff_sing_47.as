// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jigglypuff_sing_47

package jigglypuff_fla
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

    public dynamic class jigglypuff_sing_47 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var waiting:*;

        public function jigglypuff_sing_47()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 27, this.frame28, 51, this.frame52, 85, this.frame86);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.waiting = false;
            };
        }

        internal function frame7():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame28():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame52():*
        {
            this.self.playVoiceSound(3);
        }

        internal function frame86():*
        {
            if (this.self.getCPUTarget() != null)
            {
                if (this.self.getCPUTarget().getMC().currentLabel == "dizzy")
                {
                    this.self.setCPUAttackQueue("b_down");
                };
            };
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

