// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_ftilt_29

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_ftilt_29 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;

        public function chibi_ftilt_29()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 8, this.frame9, 13, this.frame14);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.updateAttackStats({"refreshRate":90});
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "hitStun":3,
                "effectSound":"brawl_zap_m"
            });
            this.self.refreshAttackID();
        }

        internal function frame14():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

