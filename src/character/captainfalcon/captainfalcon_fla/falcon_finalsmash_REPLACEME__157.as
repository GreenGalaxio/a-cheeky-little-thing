// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_finalsmash_REPLACEME__157

package captainfalcon_fla
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

    public dynamic class falcon_finalsmash_REPLACEME__157 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var touchBox:MovieClip;
        public var continuePlaying:Boolean;
        public var self:*;

        public function falcon_finalsmash_REPLACEME__157()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 12, this.frame13, 125, this.frame126, 138, this.frame139, 152, this.frame153);
        }

        internal function frame1():*
        {
            this.continuePlaying = false;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame9():*
        {
            this.self.playVoiceSound(1);
            SSF2API.playSound("entranceLeave");
            SSF2API.playSound("brawl_punch_l");
        }

        internal function frame13():*
        {
            if (!this.self.getGrabbedOpponent())
            {
                this.gotoAndPlay("fail");
            };
        }

        internal function frame126():*
        {
            this.self.updateAttackBoxStats(1, {"bypassNonGrabbed":true});
            this.self.playVoiceSound(1);
            SSF2API.playSound("entranceLeave");
            SSF2API.playSound("brawl_punch_l");
        }

        internal function frame139():*
        {
            this.self.endAttack();
        }

        internal function frame153():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

