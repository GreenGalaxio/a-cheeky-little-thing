// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//DFoverlay

package 
{
    import flash.display.MovieClip;

    public dynamic class DFoverlay extends MovieClip 
    {

        public function DFoverlay()
        {
            addFrameScript(16, this.frame17);
        }

        internal function frame17():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

