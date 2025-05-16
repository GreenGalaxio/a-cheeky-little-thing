// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_final_80

package zamus_fla
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

    public dynamic class zamus_final_80 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var countDown:int;

        public function zamus_final_80()
        {
            addFrameScript(0, this.frame1, 15, this.frame16, 23, this.frame24, 24, this.frame25, 61, this.frame62);
        }

        public function count():void
        {
            this.countDown--;
            if (this.countDown <= 0)
            {
                gotoAndPlay("end");
                SSF2API.destroyTimer(this.self, this.count);
            };
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.countDown = 120;
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.playAttackSound(1);
            };
        }

        internal function frame16():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.count, {"hitStunPause":false});
            this.self.updateAttackBoxStats(1, {
                "damage":2,
                "power":20,
                "hasEffect":true,
                "effectSound":"brawl_magic_s"
            });
        }

        internal function frame24():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame25():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":20,
                "damage":10,
                "power":90,
                "kbConstant":90,
                "hitStun":-1,
                "selfHitStun":-1,
                "effectSound":"brawl_magic_xl"
            });
            this.self.refreshAttackID();
            this.self.playAttackSound(2);
        }

        internal function frame62():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

