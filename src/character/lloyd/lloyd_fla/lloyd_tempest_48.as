// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_tempest_48

package lloyd_fla
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

    public dynamic class lloyd_tempest_48 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var disable:Boolean;

        public function lloyd_tempest_48()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 6, this.frame7, 10, this.frame11, 12, this.frame13, 16, this.frame17, 17, this.frame18, 18, this.frame19, 23, this.frame24, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nairUsed", true);
                this.disable = this.self.getGlobalVariable("upSpecUsed");
                if (this.disable)
                {
                    this.self.setAttackEnabled(false, "b_air", 99999);
                    this.self.setAttackEnabled(false, "b_up_air", 99999);
                    SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                };
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame4():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame7():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
        }

        internal function frame19():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":45,
                "power":60,
                "kbConstant":100
            });
            this.self.updateAttackBoxStats(2, {
                "direction":45,
                "power":60,
                "kbConstant":100
            });
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            if (this.disable == false)
            {
                this.self.setAttackEnabled(true, "b_up_air", 99999);
                this.self.setAttackEnabled(true, "b_air", 99999);
            };
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

