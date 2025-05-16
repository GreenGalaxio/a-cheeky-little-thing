// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.lol_38

package wario_fla
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

    public dynamic class lol_38 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var newStats:*;

        public function lol_38()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 10, this.frame11, 14, this.frame15, 24, this.frame25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.continuePlaying = false;
            this.handled = true;
        }

        internal function frame4():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame11():*
        {
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            };
        }

        internal function frame15():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
            this.newStats = {
                "direction":30,
                "power":30,
                "damage":5,
                "kbConstant":100
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

