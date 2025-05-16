// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_upB_129

package naruto_fla
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

    public dynamic class naruto_upB_129 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var controls:Object;
        public var pressed1:Boolean;
        public var pressed2:Boolean;
        public var naruto_language:*;

        public function naruto_upB_129()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 31, this.frame32, 34, this.frame35);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.pressed1 = false;
                this.pressed2 = false;
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.naruto_language = this.self.getGlobalVariable("language_Select");
                if (this.naruto_language == "JPN")
                {
                    this.self.playVoiceSound(1);
                }
                else
                {
                    SSF2API.playSound("ENG_naruto_chakradash_short", true);
                };
                this.self.playAttackSound(1);
                this.self.playAttackSound(2);
                this.self.setXSpeed(0);
            };
        }

        internal function frame2():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            this.self.attachEffect("naruto_summonClone");
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
        }

        internal function frame7():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            this.self.fireProjectile("naruto_fallclone");
            this.self.attachEffect("naruto_uSpecFlash");
            this.self.setXSpeed(14, false);
            this.self.setYSpeed(-19);
        }

        internal function frame8():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
        }

        internal function frame9():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            this.self.updateAttackStats({"allowControl":true});
        }

        internal function frame10():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
        }

        internal function frame12():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
        }

        internal function frame13():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
        }

        internal function frame16():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
        }

        internal function frame17():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
            this.self.updateAttackStats({"allowFastFall":true});
        }

        internal function frame18():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
        }

        internal function frame19():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.pressed1 = true;
            };
            if (((this.pressed1) && (this.controls.BUTTON1)))
            {
                this.pressed2 = true;
            };
            if (this.pressed2)
            {
                gotoAndPlay("kick");
            };
            this.self.endAttack();
        }

        internal function frame20():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "effectSound":"brawl_kick_m",
                "effect_id":"effect_hit2",
                "direction":31,
                "power":47,
                "kbConstant":125,
                "damage":7,
                "hitStun":4,
                "selfHitStun":4
            });
            this.self.updateAttackBoxStats(2, {
                "effectSound":"brawl_kick_m",
                "effect_id":"effect_hit2",
                "direction":31,
                "power":47,
                "kbConstant":125,
                "damage":7,
                "hitStun":4,
                "selfHitStun":4
            });
            this.self.updateAttackStats({
                "air_ease":0.57,
                "allowControl":false,
                "allowFastFall":true
            });
            this.self.setYSpeed(-6.8);
            this.self.setXSpeed(0);
        }

        internal function frame21():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame32():*
        {
            this.self.updateAttackStats({"allowControl":true});
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

