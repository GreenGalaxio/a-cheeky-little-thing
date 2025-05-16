// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsb_67

package tails_fla
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

    public dynamic class tailsb_67 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var rand:*;

        public function tailsb_67()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 12, this.frame13, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.rand = 0;
            };
        }

        internal function frame2():*
        {
            if (this.self.isCPU())
            {
                this.rand = (10 * SSF2API.random());
                if (this.rand >= 3)
                {
                    this.self.forceAttack("b_down");
                };
            };
        }

        internal function frame7():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame13():*
        {
            this.self.fireProjectile("tails_cannon", 5, -6);
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package tails_fla

