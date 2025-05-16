// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_b_aircopy_516

package goku_fla
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

    public dynamic class kgoku_b_aircopy_516 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var xframe:String;
        public var currentCharge:Number;
        public var flipped:*;

        public function kgoku_b_aircopy_516()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 30, this.frame31, 31, this.frame32, 32, this.frame33, 33, this.frame34, 34, this.frame35, 35, this.frame36, 36, this.frame37, 37, this.frame38, 38, this.frame39, 39, this.frame40, 40, this.frame41, 41, this.frame42, 42, this.frame43, 43, this.frame44, 44, this.frame45, 45, this.frame46, 46, this.frame47, 47, this.frame48, 48, this.frame49, 49, this.frame50, 50, this.frame51, 51, this.frame52, 52, this.frame53, 53, this.frame54, 54, this.frame55, 55, this.frame56, 56, this.frame57, 57, this.frame58, 58, this.frame59, 59, this.frame60, 60, this.frame61, 61, this.frame62, 62, this.frame63, 63, this.frame64, 64, this.frame65, 65, this.frame66, 66, this.frame67, 67, this.frame68, 68, this.frame69, 69, this.frame70, 70, this.frame71, 71, this.frame72, 72, this.frame73, 73, this.frame74, 74, this.frame75, 75, this.frame76, 76, this.frame77, 77, this.frame78, 78, this.frame79, 79, this.frame80, 80, this.frame81, 81, this.frame82, 82, this.frame83, 83, this.frame84, 84, this.frame85, 85, this.frame86, 86, this.frame87, 87, this.frame88, 89, this.frame90, 104, this.frame105, 105, this.frame106, 126, this.frame127, 127, this.frame128, 152, this.frame153, 153, this.frame154, 186, this.frame187);
        }

        public function flipCheck():void
        {
            this.controls = this.self.getControls();
            if (((this.controls.LEFT) && (this.self.isFacingRight())))
            {
                this.flipped = true;
            };
            if (((this.controls.RIGHT) && (!(this.self.isFacingRight()))))
            {
                this.flipped = true;
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("currentCharge", 0);
            };
        }

        internal function frame4():*
        {
            SSF2API.playSound("goku_start1");
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.xframe = "charging";
            this.self.setGlobalVariable("currentCharge", 1);
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame16():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame17():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame18():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame19():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage1.5";
        }

        internal function frame20():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame21():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame22():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame24():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame25():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame26():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage2";
            this.self.setGlobalVariable("currentCharge", 2);
        }

        internal function frame27():*
        {
            this.self.playVoiceSound(2);
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame28():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame29():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame30():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame31():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage2.5";
        }

        internal function frame32():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame33():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame34():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame35():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.self.playAttackSound(1);
        }

        internal function frame36():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame37():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame38():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame39():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage3";
            this.self.setGlobalVariable("currentCharge", 3);
        }

        internal function frame40():*
        {
            this.self.playVoiceSound(3);
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame41():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame42():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame43():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame44():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame45():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage3.25";
        }

        internal function frame46():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame47():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame48():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame49():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame50():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame51():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame52():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage3.5";
        }

        internal function frame53():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame54():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame55():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame56():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame57():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame58():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame59():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame60():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame61():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage3.75";
        }

        internal function frame62():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame63():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame64():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame65():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame66():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame67():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame68():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame69():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.self.playAttackSound(1);
        }

        internal function frame70():*
        {
            this.self.playVoiceSound(4);
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame71():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame72():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame73():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "loop";
            this.self.setGlobalVariable("currentCharge", 4);
        }

        internal function frame74():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame75():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame76():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame77():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame78():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame79():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame80():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame81():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame82():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame83():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame84():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame85():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame86():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame87():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            gotoAndPlay("loop");
        }

        internal function frame88():*
        {
            this.xframe = "attack";
            this.self.updateAttackStats({"air_ease":0});
            this.currentCharge = this.self.getGlobalVariable("currentCharge");
            this.self.updateAttackStats({"linkFrames":false});
            this.flipped = false;
            SSF2API.createTimer(this.self, 1, 2, this.flipCheck);
        }

        internal function frame90():*
        {
            this.self.playVoiceSound(5);
            if (this.flipped)
            {
                this.self.flip();
            };
            if (this.currentCharge == 2)
            {
                this.self.setXSpeed(-3, false);
                gotoAndPlay("chargeLevel2");
            };
            if (this.currentCharge == 3)
            {
                this.self.setXSpeed(-6, false);
                gotoAndPlay("chargeLevel3");
            };
            if (this.currentCharge == 4)
            {
                this.self.setXSpeed(-9, false);
                gotoAndPlay("chargeLevel4");
            };
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.fireProjectile("kkgoku_kame1");
        }

        internal function frame105():*
        {
            this.self.endAttack();
        }

        internal function frame106():*
        {
            this.self.playVoiceSound(5);
            this.self.playAttackSound(2);
            this.self.fireProjectile("kkgoku_kame2");
        }

        internal function frame127():*
        {
            this.self.endAttack();
        }

        internal function frame128():*
        {
            this.self.playVoiceSound(5);
            this.self.playAttackSound(2);
            this.self.fireProjectile("kkgoku_kame3");
        }

        internal function frame153():*
        {
            this.self.endAttack();
        }

        internal function frame154():*
        {
            this.self.playVoiceSound(5);
            this.self.playAttackSound(2);
            this.self.fireProjectile("kkgoku_kame4");
        }

        internal function frame187():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

