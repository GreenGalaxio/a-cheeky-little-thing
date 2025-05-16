// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_goku_159

package kirby_fla
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

    public dynamic class kirby_goku_159 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var goku_ground:Boolean;
        public var xframe:*;
        public var currentCharge:Number;

        public function kirby_goku_159()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 13, this.frame14, 22, this.frame23, 37, this.frame38, 42, this.frame43, 71, this.frame72, 76, this.frame77, 123, this.frame124, 124, this.frame125, 127, this.frame128, 141, this.frame142, 142, this.frame143, 144, this.frame145, 159, this.frame160, 160, this.frame161, 181, this.frame182, 182, this.frame183, 207, this.frame208, 208, this.frame209, 241, this.frame242);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("currentCharge", 0);
                this.goku_ground = this.self.isOnGround();
            };
        }

        internal function frame8():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.xframe = "charging";
            this.self.setGlobalVariable("currentCharge", 1);
        }

        internal function frame38():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame43():*
        {
            this.self.setGlobalVariable("currentCharge", 2);
            this.self.playVoiceSound(2);
        }

        internal function frame72():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame77():*
        {
            this.self.setGlobalVariable("currentCharge", 3);
            this.self.playVoiceSound(3);
        }

        internal function frame124():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame125():*
        {
            this.self.playVoiceSound(4);
        }

        internal function frame128():*
        {
            this.self.setGlobalVariable("currentCharge", 4);
        }

        internal function frame142():*
        {
            gotoAndPlay("loop");
        }

        internal function frame143():*
        {
            this.xframe = "attack";
            this.goku_ground = this.self.isOnGround();
            this.self.playVoiceSound(5);
            this.self.updateAttackStats({"air_ease":0});
            this.currentCharge = this.self.getGlobalVariable("currentCharge");
            if (this.currentCharge == 2)
            {
                if (!this.goku_ground)
                {
                    this.self.setXSpeed(-3, false);
                };
                gotoAndPlay("chargeLevel2");
            };
            if (this.currentCharge == 3)
            {
                if (!this.goku_ground)
                {
                    this.self.setXSpeed(-6, false);
                };
                gotoAndPlay("chargeLevel3");
            };
            if (this.currentCharge == 4)
            {
                if (!this.goku_ground)
                {
                    this.self.setXSpeed(-9, false);
                };
                gotoAndPlay("chargeLevel4");
            };
        }

        internal function frame145():*
        {
            this.self.playAttackSound(2);
            this.self.fireProjectile("goku_kame1", 0, -15);
        }

        internal function frame160():*
        {
            this.self.endAttack();
        }

        internal function frame161():*
        {
            this.self.playAttackSound(2);
            this.self.fireProjectile("goku_kame2", 0, -15);
        }

        internal function frame182():*
        {
            this.self.endAttack();
        }

        internal function frame183():*
        {
            this.self.playAttackSound(2);
            this.self.fireProjectile("goku_kame3", 3, -15);
        }

        internal function frame208():*
        {
            this.self.endAttack();
        }

        internal function frame209():*
        {
            this.self.playAttackSound(2);
            this.self.fireProjectile("goku_kame4", 5, -15);
        }

        internal function frame242():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

