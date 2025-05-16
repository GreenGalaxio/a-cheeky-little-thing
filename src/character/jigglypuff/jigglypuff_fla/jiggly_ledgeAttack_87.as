// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_ledgeAttack_87

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

    public dynamic class jiggly_ledgeAttack_87 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var damage:Number;

        public function jiggly_ledgeAttack_87()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 7, this.frame8, 8, this.frame9, 27, this.frame28, 28, this.frame29, 32, this.frame33, 33, this.frame34, 34, this.frame35, 37, this.frame38, 48, this.frame49, 49, this.frame50, 64, this.frame65);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.damage = 0;
                this.damage = this.self.getDamage();
                if (this.damage >= 100)
                {
                    gotoAndPlay("heavy");
                };
                this.self.setIntangibility(true);
            };
        }

        internal function frame5():*
        {
            this.self.releaseLedge();
        }

        internal function frame8():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame33():*
        {
            this.self.setYSpeed(-7);
        }

        internal function frame34():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":60,
                "kbConstant":11,
                "direction":10,
                "effectSound":"brawl_kick_l"
            });
        }

        internal function frame35():*
        {
            this.self.setXSpeed(8, false);
            this.self.setYSpeed(-3);
        }

        internal function frame38():*
        {
            this.self.setXSpeed(4, false);
            this.self.setYSpeed(5);
        }

        internal function frame49():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame50():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame65():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

