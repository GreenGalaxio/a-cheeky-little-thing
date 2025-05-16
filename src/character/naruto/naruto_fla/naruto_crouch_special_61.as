// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_crouch_special_61

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class naruto_crouch_special_61 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function naruto_crouch_special_61()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            stop();
        }

        internal function frame4():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package naruto_fla

