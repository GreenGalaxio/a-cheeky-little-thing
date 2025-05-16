// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_groundstab_special_throw__39

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
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

    public dynamic class ichigo_groundstab_special_throw__39 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ichigo_groundstab_special_throw__39()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 8, this.frame9, 26, this.frame27, 40, this.frame41);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.playVoiceSound("attackVoice2");
            };
        }

        internal function frame7():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound("attackVoice2");
            SSF2API.shakeCamera(9);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame27():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "power":65,
                "damage":7
            });
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

