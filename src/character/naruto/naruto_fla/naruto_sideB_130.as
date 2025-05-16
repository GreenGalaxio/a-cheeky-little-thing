// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_sideB_130

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class naruto_sideB_130 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var naruto_language:*;

        public function naruto_sideB_130()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 5, this.frame6, 7, this.frame8, 8, this.frame9, 16, this.frame17, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.naruto_language = this.self.getGlobalVariable("language_Select");
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(2);
            this.self.setAttackEnabled(false, "b_forward");
            this.self.setAttackEnabled(false, "b_forward_air");
        }

        internal function frame4():*
        {
            this.self.updateAttackStats({"allowFastFall":true});
        }

        internal function frame6():*
        {
            if (this.naruto_language == "JPN")
            {
                this.self.playVoiceSound(1);
            }
            else
            {
                SSF2API.playSound("ENG_naruto_forgot2", true);
            };
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.self.updateAttackStats({"allowFastFall":true});
        }

        internal function frame9():*
        {
            this.self.fireProjectile("naruto_shuriken");
        }

        internal function frame17():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

