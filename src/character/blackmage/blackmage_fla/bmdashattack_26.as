// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmdashattack_26

package blackmage_fla
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

    public dynamic class bmdashattack_26 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function bmdashattack_26()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 9, this.frame10, 11, this.frame12, 14, this.frame15, 15, this.frame16, 25, this.frame26, 35, this.frame36);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("Boost", 0);
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.self.setXSpeed(0);
            this.self.updateAttackStats({"superArmor":true});
        }

        internal function frame10():*
        {
            this.self.setXSpeed(8, false);
            this.self.playAttackSound(2);
        }

        internal function frame12():*
        {
            SSF2API.shakeCamera(14);
            SSF2API.playSound("bm_bthrow_hit");
        }

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "direction":30,
                "kbConstant":60,
                "hitStun":1,
                "selfHitStun":1
            });
        }

        internal function frame16():*
        {
            this.self.updateAttackStats({"heavyArmor":0});
        }

        internal function frame26():*
        {
            this.self.setXSpeed(0);
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

