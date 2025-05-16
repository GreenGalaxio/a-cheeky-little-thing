// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_jab_106

package zelda_fla
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

    public dynamic class zelda_jab_106 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;

        public function zelda_jab_106()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 13, this.frame14);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.self.refreshAttackID();
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

