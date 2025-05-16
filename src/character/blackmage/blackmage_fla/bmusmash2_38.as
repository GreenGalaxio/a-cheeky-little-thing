// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmusmash2_38

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

    public dynamic class bmusmash2_38 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;

        public function bmusmash2_38()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 20, this.frame21, 27, this.frame28, 28, this.frame29, 46, this.frame47, 53, this.frame54, 93, this.frame94);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = null;
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("Boost", 0);
            };
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
        }

        internal function frame12():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame21():*
        {
            this.self.updateAttackBoxStats(1, {
                "priority":2,
                "effectSound":"brawl_fire_m",
                "damage":5
            });
            this.self.updateAttackBoxStats(2, {
                "priority":2,
                "effectSound":"brawl_fire_m",
                "damage":5
            });
            this.self.refreshAttackID();
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            this.xframe = "attack2";
            this.self.updateAttackStats({"refreshRate":1});
            this.self.updateAttackBoxStats(2, {
                "direction":160,
                "power":45,
                "damage":1,
                "hitStun":1,
                "selfHitStun":0,
                "priority":-1,
                "effectSound":"brawl_fire_m"
            });
            this.self.updateAttackBoxStats(1, {
                "direction":160,
                "power":45,
                "damage":1,
                "hitStun":1,
                "selfHitStun":0,
                "priority":-1,
                "effectSound":"brawl_fire_m"
            });
            this.self.playAttackSound(1);
        }

        internal function frame47():*
        {
            this.self.playAttackSound(2);
            this.self.updateAttackStats({"refreshRate":200});
            this.self.updateAttackBoxStats(1, {
                "direction":90,
                "power":10,
                "hitStun":17
            });
            this.self.updateAttackBoxStats(2, {
                "direction":90,
                "power":10,
                "hitStun":17
            });
            this.self.refreshAttackID();
        }

        internal function frame54():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "power":100,
                "kbConstant":100,
                "hitStun":1,
                "damage":5
            });
        }

        internal function frame94():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

