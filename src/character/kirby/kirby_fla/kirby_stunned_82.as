// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_stunned_82

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kirby_stunned_82 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function kirby_stunned_82()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 9, this.frame10);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            SSF2API.playSound("kirby_dizzy");
        }

        internal function frame10():*
        {
            gotoAndPlay("again");
        }


    }
}//package kirby_fla

