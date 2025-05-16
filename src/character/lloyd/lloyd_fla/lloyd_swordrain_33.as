// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_swordrain_33

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class lloyd_swordrain_33 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var controls:Object;
        public var unpressed:Boolean;
        public var xframe:String;

        public function lloyd_swordrain_33()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 29, this.frame30, 30, this.frame31, 37, this.frame38);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.unpressed = true;
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
            this.self.playVoiceSound(2);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame17():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
            if (((this.controls.UP) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
        }

        internal function frame18():*
        {
            this.self.updateAttackBoxStats(1, {
                "selfHitStun":0,
                "direction":5
            });
            this.self.updateAttackBoxStats(2, {
                "selfHitStun":0,
                "direction":5
            });
            this.self.refreshAttackID();
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
            if (((this.controls.UP) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
            if (((this.controls.UP) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
        }

        internal function frame20():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
            if (((this.controls.UP) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
        }

        internal function frame21():*
        {
            this.self.updateAttackBoxStats(1, {"direction":330});
            this.self.updateAttackBoxStats(2, {"direction":330});
            this.self.refreshAttackID();
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
            if (((this.controls.UP) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
        }

        internal function frame22():*
        {
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            if (((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)) && (this.unpressed)))
            {
                this.self.refreshAttackID();
                gotoAndPlay("sonicthrust");
            };
            if ((((this.controls.UP) && (this.controls.BUTTON1)) && (this.unpressed)))
            {
                this.self.refreshAttackID();
                gotoAndPlay("tigerblade");
            };
        }

        internal function frame23():*
        {
            this.controls = this.self.getControls();
            if (((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)) && (this.unpressed)))
            {
                this.self.refreshAttackID();
                gotoAndPlay("sonicthrust");
            };
            if ((((this.controls.UP) && (this.controls.BUTTON1)) && (this.unpressed)))
            {
                this.self.refreshAttackID();
                gotoAndPlay("tigerblade");
            };
        }

        internal function frame24():*
        {
            this.self.updateAttackBoxStats(1, {"direction":5});
            this.self.updateAttackBoxStats(2, {"direction":5});
            this.self.refreshAttackID();
            this.controls = this.self.getControls();
            if (((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)) && (this.unpressed)))
            {
                this.self.refreshAttackID();
                gotoAndPlay("sonicthrust");
            };
            if ((((this.controls.UP) && (this.controls.BUTTON1)) && (this.unpressed)))
            {
                this.self.refreshAttackID();
                gotoAndPlay("tigerblade");
            };
        }

        internal function frame25():*
        {
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            if (((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)) && (this.unpressed)))
            {
                this.self.refreshAttackID();
                gotoAndPlay("sonicthrust");
            };
            if ((((this.controls.UP) && (this.controls.BUTTON1)) && (this.unpressed)))
            {
                this.self.refreshAttackID();
                gotoAndPlay("tigerblade");
            };
        }

        internal function frame26():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) || (this.controls.LEFT)) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
            if (((this.controls.UP) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
        }

        internal function frame27():*
        {
            this.self.updateAttackBoxStats(1, {"direction":30});
            this.self.updateAttackBoxStats(2, {"direction":30});
            this.self.refreshAttackID();
        }

        internal function frame28():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame30():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":5,
                "power":3,
                "kbConstant":286,
                "direction":45,
                "hitStun":10,
                "selfHitStun":10
            });
            this.self.updateAttackBoxStats(2, {
                "damage":5,
                "power":3,
                "kbConstant":286,
                "direction":45,
                "hitStun":10,
                "selfHitStun":10
            });
            this.self.refreshAttackID();
        }

        internal function frame31():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame38():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

