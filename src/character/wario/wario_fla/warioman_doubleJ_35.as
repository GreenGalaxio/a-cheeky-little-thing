// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_doubleJ_35

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class warioman_doubleJ_35 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var done:*;

        public function warioman_doubleJ_35()
        {
            addFrameScript(0, this.frame1, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.done = false;
        }

        internal function frame21():*
        {
            this.done = true;
            this.gotoAndPlay("again");
        }


    }
}//package wario_fla

