// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_zamus_209

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

    public dynamic class kirby_zamus_209 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var nSpecCharge:Boolean;

        public function kirby_zamus_209()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 11, this.frame12, 21, this.frame22, 22, this.frame23, 32, this.frame33);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                this.nSpecCharge = false;
            };
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.nSpecCharge = true;
                gotoAndPlay("fakeCharge");
            }
            else
            {
                this.nSpecCharge = false;
                gotoAndPlay("attack");
            };
        }

        internal function frame12():*
        {
            if (!this.nSpecCharge)
            {
                this.self.fireProjectile("paralyzer_weak", 0, 10);
            }
            else
            {
                if (this.nSpecCharge)
                {
                    this.self.fireProjectile("paralyzer_strong", 0, 10);
                };
            };
            this.self.playAttackSound(2);
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }

        internal function frame23():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            gotoAndPlay("attack");
        }


    }
}//package kirby_fla

