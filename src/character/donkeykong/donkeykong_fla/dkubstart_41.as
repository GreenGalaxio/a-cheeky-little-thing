// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkubstart_41

package donkeykong_fla
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

    public dynamic class dkubstart_41 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;

        public function dkubstart_41()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 7, this.frame8, 8, this.frame9, 9, this.frame10, 12, this.frame13, 16, this.frame17, 18, this.frame19, 20, this.frame21, 24, this.frame25, 28, this.frame29, 29, this.frame30, 32, this.frame33, 33, this.frame34, 36, this.frame37, 38, this.frame39, 40, this.frame41, 42, this.frame43, 43, this.frame44, 44, this.frame45, 45, this.frame46, 49, this.frame50, 59, this.frame60);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.self.updateAttackStats({"superArmor":false});
        }

        internal function frame8():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "canFallOff":true,
                "refreshRate":4
            });
            this.self.updateAttackBoxStats(1, {
                "power":5,
                "direction":50,
                "damage":1,
                "hitStun":2,
                "selfHitStun":1,
                "effectSound":"brawl_punch_s",
                "priority":0
            });
        }

        internal function frame9():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame10():*
        {
        }

        internal function frame13():*
        {
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame17():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame19():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame21():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame25():*
        {
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame29():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame30():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame33():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame34():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame37():*
        {
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame39():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame41():*
        {
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame43():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame44():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackStats({"refreshRate":20});
            this.self.updateAttackBoxStats(1, {
                "direction":70,
                "power":40,
                "kbConstant":90,
                "damage":4,
                "hitStun":3,
                "selfHitStun":1
            });
        }

        internal function frame45():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame46():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame50():*
        {
            this.self.attachEffect("dk_upBSmoke");
            this.self.updateAttackStats({
                "air_ease":-1,
                "allowControl":false,
                "xSpeedDecayAir":-2
            });
        }

        internal function frame60():*
        {
            this.self.endAttack();
        }


    }
}//package donkeykong_fla

