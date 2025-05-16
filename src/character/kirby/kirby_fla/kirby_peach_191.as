// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_peach_191

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class kirby_peach_191 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var counterBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var peach_used:Boolean;
        public var peach_grounded:Boolean;

        public function kirby_peach_191()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 16, this.frame17, 29, this.frame30, 30, this.frame31, 34, this.frame35, 53, this.frame54);
        }

        public function counter(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_COUNTER, this.counter);
            gotoAndPlay("counter");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.peach_used = this.self.getGlobalVariable("kirbyPeachUsed");
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_COUNTER, this.counter, null);
            };
        }

        internal function frame6():*
        {
            this.peach_grounded = this.self.isOnGround();
            this.self.playAttackSound(1);
            this.self.setGlobalVariable("kirbyPeachUsed", true);
            this.self.setInvincibility(true);
            if (((!(this.peach_used)) && (!(this.peach_grounded))))
            {
                this.self.setYSpeed(-11);
            };
        }

        internal function frame17():*
        {
            this.self.setInvincibility(false);
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }

        internal function frame31():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame35():*
        {
            this.self.setInvincibility(false);
        }

        internal function frame54():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

