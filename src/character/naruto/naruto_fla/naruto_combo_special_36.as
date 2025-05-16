// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_combo_special_36

package naruto_fla
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

    public dynamic class naruto_combo_special_36 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;

        public function naruto_combo_special_36()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 7, this.frame8, 10, this.frame11, 11, this.frame12, 20, this.frame21);
        }

        public function jabCheck():void
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.continuePlaying = false;
            this.handled = true;
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame5():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame8():*
        {
            this.continuePlaying = false;
            this.handled = false;
            SSF2API.createTimer(this.self, 1, 4, this.jabCheck);
        }

        internal function frame11():*
        {
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            };
        }

        internal function frame12():*
        {
            SSF2API.destroyTimer(this.self, this.jabCheck);
            this.self.refreshAttackID();
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {
                "direction":50,
                "power":55,
                "damage":6,
                "hitLag":-1.3
            });
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

